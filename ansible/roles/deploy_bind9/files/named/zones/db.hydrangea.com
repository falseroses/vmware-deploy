@       IN      SOA     bind9.hydrangea.com. admin.hydrangea.com. (
                  3         ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
    IN      NS      bind9.hydrangea.com.

; name servers - A records
bind9.hydrangea.com.          IN      A      192.168.1.102

; 192.168.0.0/16 - A records
gitlab.hydrangea.com.         IN      A      192.168.1.100
jenkins.hydrangea.com.        IN      A      192.168.1.101
client.hydrangea.com.         IN      A      192.168.1.103
