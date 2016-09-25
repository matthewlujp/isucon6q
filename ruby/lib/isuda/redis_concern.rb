module RedisConern
  def redis
    Thread.current[:redis] ||= begin
      redis_instance ||= new.Redis host: '127.0.0.1', port: '12345'  # <= UNIX domain socket?
    end
  end

# -----------------------------
# Entry DB
# -----------------------------
#   id          (LONG)
#   author_id   (LONG)
#   keyword     (CHAR)
#   description (TEXT)
#   created_at  (datetime)
#   updated_at  (datetime)
# ----------------------------

  def load_entries(db, redis)
    entries = db.xquery(
      %|SELECT keyword, description, author_id,
      unix_timestamp(created_at), unix_timestamp(updated_at)
      FROM entry|)

    entries.each do |entry|
      # Save to Redis

    end
  end

  class NoRecordError << StandarError
    def error_status
      1000
    end
  end

  class InvalidAttributesError << StandarError
    def error_status
      1001
    end
  end


  class Entry
    def initialize(id, hash:nil)
      return unless id

      @id = id

      # Set attributes to instance variables
      self.ATTRS.each do |attribute|
        unless hash
          val = redis.hget self.hkey(attribute), id
          raise NoRecordError if val.nil?
          self.instance_variable_set("@#{attribute.to_s}", val)
        else
          val = hash[attribute]
          raise InvalidAttributesError if val.nil?
          self.instance_variable_set("@#{attribute.to_s}", val)
        end
      end

    end

    # Create reader
    self.ATTRS.each do |attribute|
      attr_reader attribute
    end

    # Update method for each attribute
    self.ATTRS.each do |attribute|
      define_method ("update_%s" % attribute).to_sym do |val|
        redis.hset self.hkey(attribute), id, val
        self.instance_variable_set("@#{attribute}", val)
      end
    end

    # Set method for each attribute
    self.ATTRS.each do |attribute|
      define_method ("%s=" % attribute).to_sym do |val|
        self.instance_variable_set("@#{attribute}", val)
      end
    end

    def update!
      self.ATTRS.each do |attribute|
        self.send ("update_%s" % attribute.to_s).to_sym, self.instance_variable_get("@#{attribue}"
      end
    end

    def delete_record(id)
      return unless id

      self.ATTRS.each do |attribute|
        count = redis.hdel hkey(attribute), id
        raise NoRecordError if count == 0
      end
    end


    class << self
      ATTRS = %i[keyword description author_id created_at updated_at]

      def create_record(hash, id:nil)
        redis.multi do
          id ||= id_counter + 1
          id_incr
          record_instance = self.class.new(id, hash: hash)
          record_instance.update!
        end
      end

      def record_total
        redis.hlen hkey(ATTRS[0])
      end

      def id_counter
        @@id_counter ||= record_total
      end

      def id_incr
        @@id_counter = id_counter + 1
      end

      def hkey(attr)
        "%s_%s" % [self.class.to_s.downcase, attr.to_s.downcase]
      end
    end
  end



end
