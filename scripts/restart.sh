rm -f /var/log/nginx/access.log /var/log/nginx/error.log

systemctl restart nginx.service
systemctl restart isuda.ruby.service
systemctl restart isutar.ruby.service
