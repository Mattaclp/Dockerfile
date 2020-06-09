FROM alpine:latest
#FROM arm64v8/alpine:latest

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add nginx tzdata && \
    mkdir /var/www/html && \
    mkdir /etc/nginx/ssl && \
    mkdir /run/nginx && \
    touch /run/nginx/nginx.pid && \
    echo "server {" > /etc/nginx/conf.d/default.conf && \
    echo "listen 80;" >> /etc/nginx/conf.d/default.conf && \
    echo "listen [::]:80;" >> /etc/nginx/conf.d/default.conf && \
    echo "listen 443 ssl http2;" >> /etc/nginx/conf.d/default.conf && \
    echo "listen [::]:443 ssl http2;" >> /etc/nginx/conf.d/default.conf && \
    echo "server_name mb3admin.com;" >> /etc/nginx/conf.d/default.conf && \
    echo "root /var/www/html;" >> /etc/nginx/conf.d/default.conf && \
    echo "" >> /etc/nginx/conf.d/default.conf && \
    echo "ssl_protocols TLSv1.3 TLSv1.2 TLSv1.1 TLSv1;" >> /etc/nginx/conf.d/default.conf && \
    echo "ssl_certificate /etc/nginx/ssl/mb3admin.com.cert.pem;" >> /etc/nginx/conf.d/default.conf && \
    echo "ssl_certificate_key /etc/nginx/ssl/mb3admin.com.key.pem;" >> /etc/nginx/conf.d/default.conf && \
    echo "ssl_ciphers           HIGH:!aNULL:!MD5;" >> /etc/nginx/conf.d/default.conf && \
    echo "    add_header Access-Control-Allow-Origin *;" >> /etc/nginx/conf.d/default.conf && \
    echo "    add_header Access-Control-Allow-Headers *;" >> /etc/nginx/conf.d/default.conf && \
    echo "    add_header Access-Control-Allow-Method *;" >> /etc/nginx/conf.d/default.conf && \
    echo "    add_header Access-Control-Allow-Credentials true;" >> /etc/nginx/conf.d/default.conf && \
    echo "" >> /etc/nginx/conf.d/default.conf && \
    echo "location /admin/service/registration/validateDevice {" >> /etc/nginx/conf.d/default.conf && \
    echo "    default_type application/json;" >> /etc/nginx/conf.d/default.conf && \
    echo "  return 200 '{"cacheExpirationDays": 7,"message": "Device Valid","resultCode": "GOOD"}';" >> /etc/nginx/conf.d/default.conf && \
    echo "}" >> /etc/nginx/conf.d/default.conf && \
    echo "location /admin/service/registration/validate {" >> /etc/nginx/conf.d/default.conf && \
    echo "    default_type application/json;" >> /etc/nginx/conf.d/default.conf && \
    echo "  return 200 '{"featId":"","registered":true,"expDate":"2099-01-01","key":""}';" >> /etc/nginx/conf.d/default.conf && \
    echo "}" >> /etc/nginx/conf.d/default.conf && \
    echo "location /admin/service/registration/getStatus {" >> /etc/nginx/conf.d/default.conf && \
    echo "    default_type application/json;" >> /etc/nginx/conf.d/default.conf && \
    echo "  return 200 '{"deviceStatus":"","planType":"","subscriptions":{}}';" >> /etc/nginx/conf.d/default.conf && \
    echo "}" >> /etc/nginx/conf.d/default.conf && \
    echo "}" >> /etc/nginx/conf.d/default.conf && \
    echo "" >> /etc/nginx/conf.d/default.conf && \
    echo "-----BEGIN CERTIFICATE-----" > /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MIIEHDCCAwSgAwIBAgIJAL0OjFdDMG2DMA0GCSqGSIb3DQEBCwUAMGgxCzAJBgNV" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdIYWlEaWFuMRMwEQYD" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "VQQKDApHTUNlcnQub3JnMSAwHgYDVQQDDBdHTUNlcnQgUlNBIFJvb3QgQ0EgLSAw" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MTAeFw0yMDAyMDcwOTAzMjhaFw0yMjA1MTEwOTAzMjhaMFwxCzAJBgNVBAYTAlVT" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MQswCQYDVQQIDAJVUzELMAkGA1UEBwwCVVMxDTALBgNVBAoMBEVtYnkxDTALBgNV" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BAsMBEVtYnkxFTATBgNVBAMMDG1iM2FkbWluLmNvbTCCASIwDQYJKoZIhvcNAQEB" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BQADggEPADCCAQoCggEBAM+biRQ4XFqWCEkQT1j871P1VStlF+AZEJxesG/M/dVt" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "pwLTplsfteZ/aVsPgbq8JxJQw2MCiBEJ1IYJYSxncBBYzXmSWBLCi/Wh6y9RNn8B" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "dDBiaUpZJ7HDgYzhJheB/rM/iGbihf2z5ytr1ElkTdTX4h2fakOunNqhd6OlrxQN" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "5vz60+EP5YzHi/Iq0oYu82A/2HTF1Pudx2VBGYDWbF3RTaDo69IOCajE819fzZPU" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "7r8mK+2yZFL14X0gDmRQayp8I7ITotvijS4vmNkvxvRwiDilriDZpHFzuoy+vQAF" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "SXioiIeKOMYLSwmFeTj/vvFYxcOjp+CfbAPGjlzVCxsCAwEAAaOB1DCB0TAMBgNV" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "HRMBAf8EAjAAMAsGA1UdDwQEAwIEsDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYB" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BQUHAwIwLAYJYIZIAYb4QgENBB8WHUdNQ2VydC5vcmcgU2lnbmVkIENlcnRpZmlj" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "YXRlMB0GA1UdDgQWBBT8YfEFgmfd1/IzW1SmfZEjv1P0XTAfBgNVHSMEGDAWgBSa" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "J+ucgJPLDenDPdFqehzisZ846TAnBgNVHREEIDAeggxtYjNhZG1pbi5jb22CDiou" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "bWIzYWRtaW4uY29tMA0GCSqGSIb3DQEBCwUAA4IBAQASIGe/3bUCfJRgvhrST+84" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "WGm7d+tClD0BSQA8wNHduDwhuhYzymehu55JAAwyUufXnPNVpB69jZvE8uv1Rk+a" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "peMdrWBOh/mv9zutNY3t3hfImERctpLmwndIvbHBe4X11ARRKx1TmQ6tApH1qrNW" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "TGoBo9RwS4pYLwtob8I4L4K8CBgLLlW7ewPqpS8YgqcS5mx6YBqxrB8LU/mJAhmS" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BW63uJyRRF/pDGkQfXwG4gxqysQPusG8CjAXxvk7yXmrRXME8xNrmkeoCjBTrHL2" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "Hhr/oZxDvtjEWkO8OslNglm/dWR1qfkC6TkNBf4YSjWU9h5ssu3jA5mF3bRAQZn3" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "-----END CERTIFICATE-----" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "-----BEGIN CERTIFICATE-----" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MIIDsDCCApigAwIBAgIJAMjrH5w5KmnFMA0GCSqGSIb3DQEBCwUAMGgxCzAJBgNV" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "BAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdIYWlEaWFuMRMwEQYD" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "VQQKDApHTUNlcnQub3JnMSAwHgYDVQQDDBdHTUNlcnQgUlNBIFJvb3QgQ0EgLSAw" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MTAeFw0xOTEwMjQxMjM3NDRaFw0zOTA3MTExMjM3NDRaMGgxCzAJBgNVBAYTAkNO" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdIYWlEaWFuMRMwEQYDVQQKDApH" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "TUNlcnQub3JnMSAwHgYDVQQDDBdHTUNlcnQgUlNBIFJvb3QgQ0EgLSAwMTCCASIw" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANCpZk/j4CIM2o2IiZHTsQA10LTN" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "fD/dV//kyn9QXQwpRpcgTLuYassucaDSvkS56+p7jRKMgD9ZnE4QNf3Ay/UEACYG" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "UH7OubZtigxJpLjS69dHfy3yqt8GSOKsfFu6VZ//QphFGw4NkkCYngOuxhmV7WU0" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "xNasollGGuzjBmp46/bev8aomkI33OxSXWna3oCn3BSScgkoyWJTNN1+EwCZANO3" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "FeKUyPMGOhi49QlV4OyUgCfGlFqhAGZAT/PMo8oPwwmyHrlyn+jqin7+qKVF9loc" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "Nle9YyBi7eZkDbSoAUOg2WFaDDRrPhUnNU+l2TqCP+uCgyxU74Lphj00v00CAwEA" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "AaNdMFswHQYDVR0OBBYEFJon65yAk8sN6cM90Wp6HOKxnzjpMB8GA1UdIwQYMBaA" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "FJon65yAk8sN6cM90Wp6HOKxnzjpMAwGA1UdEwQFMAMBAf8wCwYDVR0PBAQDAgEG" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "MA0GCSqGSIb3DQEBCwUAA4IBAQBcoJlabv5wgUj6tgbb3gUVYHKlQWr2aaPWg1Vs" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "ru5ExyPcEhyQ2XM5AdnOMjKiTikyPYwk1/K1tJSNN5AmCfdofWr4m074s+Rf/i+h" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "dBuh2vjZee9L/NV2ZRcxpwp9e561+JBXoHvZ0JHDBGQ0WYsJ+m9fRxCR12oIVWWv" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "SAjbyetRRO+oTvi3dX2OQUgJhflS4/cxQblYxgL5nMIa+MVamXUNNfwEk3TZh4K/" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "NgtQY5KraEUU7bCkbbKdX2r+njobTQpbBV8uZ/JwsNghx4gfB+3QrteVfceQ+ip+" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "CpEU9X3JD9WkxEVFKBa0Q+TllSny07of0cWmRuwZlLUruBJD" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "-----END CERTIFICATE-----" >> /etc/nginx/ssl/mb3admin.com.cert.pem && \
    echo "-----BEGIN RSA PRIVATE KEY-----" > /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "MIIEpQIBAAKCAQEAz5uJFDhcWpYISRBPWPzvU/VVK2UX4BkQnF6wb8z91W2nAtOm" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "Wx+15n9pWw+BurwnElDDYwKIEQnUhglhLGdwEFjNeZJYEsKL9aHrL1E2fwF0MGJp" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "SlknscOBjOEmF4H+sz+IZuKF/bPnK2vUSWRN1NfiHZ9qQ66c2qF3o6WvFA3m/PrT" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "4Q/ljMeL8irShi7zYD/YdMXU+53HZUEZgNZsXdFNoOjr0g4JqMTzX1/Nk9TuvyYr" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "7bJkUvXhfSAOZFBrKnwjshOi2+KNLi+Y2S/G9HCIOKWuINmkcXO6jL69AAVJeKiI" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "h4o4xgtLCYV5OP++8VjFw6On4J9sA8aOXNULGwIDAQABAoIBAQCM9Qyohu/lrXJo" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "sUM+p1WTysIOGbCRPlNx6DShZCyASdgYaj3MJwapPp747dlmQTPCEsXmpqRd9S+v" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "5hRtQrnqz3CLd5qG+kJu/4YgdWKr7v/Fjjvw+AGkh5qhXYkwctnNOHjTakARlqGB" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "cNANGKZjukRTWpaa56amJvWFTgxGb0NmLHS0uHuuz8l823ULTTd/1BycDtlu2Ebn" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "DvvtRQv9LjhSFJ7J48GLbyF6Eqr/acOUa80WCwlmK6UcFnzwknzGdkSXIJ6jDUcI" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "/6v5yTbhaEKa5KAtEusHGAZ/5n28UudhmWOMjlfbQIBPXX/2zhgYyRCfM9GeafZA" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "hh8/p8ABAoGBAP61fXHOjclmWsCAcYeQ4X6Cv3swlsc/QwGicf36WS2OXemRIgBe" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "07wZwbOsnkFDyMVUbr0poYvjjXpYZbaQ3zlU81gkLpCRFFnyrtckCy5HGc8kMP/t" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "Lqt5/EE58Pt1TXif0DZ9LS3WAGJUWPgfU57bStLg4V9AiBjPQH+2V+ABAoGBANCo" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "7T+6/sp53GNC+rl3ja466CTKv5mTIPusGJZiJvaSaHrcHRj9Tp1w0OcyFzlrj4fD" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "MViDbwXSKr0QMPlM8n1xY2G9PJWuCvh8JcaYXUdgBshADVvBJmI+jYouRV9x9s8r" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "g5YnJD0xtSGhb4teNECWLtlVlCTimbkgQj1m8GsbAoGBALLrIhdTlN2ofI9Eqnsk" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "FoIbrg4G76M+mP8I8TILLaGGpAlx3YSNGAbFwP9JflEyIFIdITzXhZcSXUtX1PsN" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "gQBw4A9GOz9p6fXVN2QA+amkYEjVj2X3YhUqNzxKSzEYETdua4AbJiVQciygO27v" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "8nlgaYsAVM/oMLHcw93yZIABAoGBAJe7j7K9X1SLoxjHdx1xc6TUD0XZ7dRWqjB5" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "J/QLcfvx4WoeMEagxQ82H6NPyJWnwtrdtT+BbDWWbB/J62MOcnOIBdXoT2slAbNK" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "TAoLeCFUEfqCoXQsk6XziOeH2EiczfY+1VRWKEMbp3TKORvmqCajT3QZiD3+TfzS" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "GXkfJwsrAoGAUXjYXHbXM5iaR/bbIL8abGR9ZsPzEF3pt1C22Wj3YL+bTND1ItPw" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "ZDbkUjDyX5nyTehoUkCO28Kat7Hmk4NNBsCYPvwgf9UENEMSUYnT4w1sYJ6oDNXG" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "j3JPrSstdYrIGIiP+b+HEsItAO3x7TIZPmm+sXLRE3yywuYqlu6kN3Q=" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "-----END RSA PRIVATE KEY-----" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "" >> /etc/nginx/ssl/mb3admin.com.key.pem && \
    echo "-----BEGIN CERTIFICATE REQUEST-----" > /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "MIICoTCCAYkCAQAwXDELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAlVTMQswCQYDVQQH" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "DAJVUzENMAsGA1UECgwERW1ieTENMAsGA1UECwwERW1ieTEVMBMGA1UEAwwMbWIz" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "YWRtaW4uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz5uJFDhc" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "WpYISRBPWPzvU/VVK2UX4BkQnF6wb8z91W2nAtOmWx+15n9pWw+BurwnElDDYwKI" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "EQnUhglhLGdwEFjNeZJYEsKL9aHrL1E2fwF0MGJpSlknscOBjOEmF4H+sz+IZuKF" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "/bPnK2vUSWRN1NfiHZ9qQ66c2qF3o6WvFA3m/PrT4Q/ljMeL8irShi7zYD/YdMXU" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "+53HZUEZgNZsXdFNoOjr0g4JqMTzX1/Nk9TuvyYr7bJkUvXhfSAOZFBrKnwjshOi" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "2+KNLi+Y2S/G9HCIOKWuINmkcXO6jL69AAVJeKiIh4o4xgtLCYV5OP++8VjFw6On" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "4J9sA8aOXNULGwIDAQABoAAwDQYJKoZIhvcNAQELBQADggEBAEut/SeCZ3h/YI+0" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "Eu0dpR4DcSPYm0fQsb3ljyQMMnORnRq8atX3lRWdTf8UkPU8radKyS9qjXj2oYJl" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "N8SMKQ0VSh4d492D1P2wTXWPA4nJdoTQ1tX+CU8xkC2XBNq0l72e/PdcwLWBctx0" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "kToe1vqU/sSTzcaJJjSFH3aCakLu6aAsJsrh/bUv42zOLZZRy12WJ410Wyqz23bP" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "ukyWeb73keCufqCrX1GgcF4/4Mq2+27Nj5/2mpD7bSWcaNQdW7mdJ+cmt/hCD2ss" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "42ZntZxR1bFThrp+j4LPQM+6eSjYqTLYly/NdU7dljyWEOUjkfuNlVILY1/PGAM9" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "d/CXH4s=" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "-----END CERTIFICATE REQUEST-----" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "" >> /etc/nginx/ssl/mb3admin.com.req.pem && \
    echo "-----BEGIN CERTIFICATE-----" > /var/www/html/CA.cer && \
    echo "MIIDsDCCApigAwIBAgIJAMjrH5w5KmnFMA0GCSqGSIb3DQEBCwUAMGgxCzAJBgNV" >> /var/www/html/CA.cer && \
    echo "BAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdIYWlEaWFuMRMwEQYD" >> /var/www/html/CA.cer && \
    echo "VQQKDApHTUNlcnQub3JnMSAwHgYDVQQDDBdHTUNlcnQgUlNBIFJvb3QgQ0EgLSAw" >> /var/www/html/CA.cer && \
    echo "MTAeFw0xOTEwMjQxMjM3NDRaFw0zOTA3MTExMjM3NDRaMGgxCzAJBgNVBAYTAkNO" >> /var/www/html/CA.cer && \
    echo "MRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQHDAdIYWlEaWFuMRMwEQYDVQQKDApH" >> /var/www/html/CA.cer && \
    echo "TUNlcnQub3JnMSAwHgYDVQQDDBdHTUNlcnQgUlNBIFJvb3QgQ0EgLSAwMTCCASIw" >> /var/www/html/CA.cer && \
    echo "DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANCpZk/j4CIM2o2IiZHTsQA10LTN" >> /var/www/html/CA.cer && \
    echo "fD/dV//kyn9QXQwpRpcgTLuYassucaDSvkS56+p7jRKMgD9ZnE4QNf3Ay/UEACYG" >> /var/www/html/CA.cer && \
    echo "UH7OubZtigxJpLjS69dHfy3yqt8GSOKsfFu6VZ//QphFGw4NkkCYngOuxhmV7WU0" >> /var/www/html/CA.cer && \
    echo "xNasollGGuzjBmp46/bev8aomkI33OxSXWna3oCn3BSScgkoyWJTNN1+EwCZANO3" >> /var/www/html/CA.cer && \
    echo "FeKUyPMGOhi49QlV4OyUgCfGlFqhAGZAT/PMo8oPwwmyHrlyn+jqin7+qKVF9loc" >> /var/www/html/CA.cer && \
    echo "Nle9YyBi7eZkDbSoAUOg2WFaDDRrPhUnNU+l2TqCP+uCgyxU74Lphj00v00CAwEA" >> /var/www/html/CA.cer && \
    echo "AaNdMFswHQYDVR0OBBYEFJon65yAk8sN6cM90Wp6HOKxnzjpMB8GA1UdIwQYMBaA" >> /var/www/html/CA.cer && \
    echo "FJon65yAk8sN6cM90Wp6HOKxnzjpMAwGA1UdEwQFMAMBAf8wCwYDVR0PBAQDAgEG" >> /var/www/html/CA.cer && \
    echo "MA0GCSqGSIb3DQEBCwUAA4IBAQBcoJlabv5wgUj6tgbb3gUVYHKlQWr2aaPWg1Vs" >> /var/www/html/CA.cer && \
    echo "ru5ExyPcEhyQ2XM5AdnOMjKiTikyPYwk1/K1tJSNN5AmCfdofWr4m074s+Rf/i+h" >> /var/www/html/CA.cer && \
    echo "dBuh2vjZee9L/NV2ZRcxpwp9e561+JBXoHvZ0JHDBGQ0WYsJ+m9fRxCR12oIVWWv" >> /var/www/html/CA.cer && \
    echo "SAjbyetRRO+oTvi3dX2OQUgJhflS4/cxQblYxgL5nMIa+MVamXUNNfwEk3TZh4K/" >> /var/www/html/CA.cer && \
    echo "NgtQY5KraEUU7bCkbbKdX2r+njobTQpbBV8uZ/JwsNghx4gfB+3QrteVfceQ+ip+" >> /var/www/html/CA.cer && \
    echo "CpEU9X3JD9WkxEVFKBa0Q+TllSny07of0cWmRuwZlLUruBJD" >> /var/www/html/CA.cer && \
    echo "-----END CERTIFICATE-----" >> /var/www/html/CA.cer && \
    echo "<!DOCTYPE html>" >> /var/www/html/index.html && \
    echo "<html lang="en">" >> /var/www/html/index.html && \
    echo "<head>" >> /var/www/html/index.html && \
    echo "    <meta charset="UTF-8">" >> /var/www/html/index.html && \
    echo "    <meta name="viewport" content="width=device-width, initial-scale=1.0">" >> /var/www/html/index.html && \
    echo "    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />" >> /var/www/html/index.html && \
    echo "    <meta content="telephone=no" name="format-detection" />" >> /var/www/html/index.html && \
    echo "    <title>CA安装</title>" >> /var/www/html/index.html && \
    echo "</head>" >> /var/www/html/index.html && \
    echo "<body>" >> /var/www/html/index.html && \
    echo "    <h3>" >> /var/www/html/index.html && \
    echo "        <a id='cer' href="http://mb3admin.com/index.html">安装证书</a>" >> /var/www/html/index.html && \
    echo "    </h3>" >> /var/www/html/index.html && \
    echo "</body>" >> /var/www/html/index.html && \
    echo "</html>" >> /var/www/html/index.html && \
    rm -rf /tmp/*

ENV TZ Asia/Shanghai

CMD ["sh", "-c", "/usr/sbin/nginx ; tail -f /dev/null"]