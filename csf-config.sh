cp /etc/csf/csf.conf{,.backup} && \
sed -i 's/^MESSENGER = .*/MESSENGER = "1"/' /etc/csf/csf.conf && \
sed -i 's/^MESSENGER_TEMP = .*/MESSENGER_TEMP = "1"/' /etc/csf/csf.conf && \
sed -i 's/^MESSENGER_PERM = .*/MESSENGER_PERM = "1"/' /etc/csf/csf.conf && \
sed -i 's/^MESSENGER_USER = .*/MESSENGER_USER = "csf"/' /etc/csf/csf.conf && \
sed -i 's/^MESSENGERV2 = .*/MESSENGERV2 = "1"/' /etc/csf/csf.conf && \
sed -i 's/^MESSENGER_HTTPS_IN = .*/MESSENGER_HTTPS_IN = "443,2083,2087,2096"/' /etc/csf/csf.conf && \
sed -i 's/^RECAPTCHA_SITEKEY = .*/RECAPTCHA_SITEKEY = "6LfFnuYhAAAAAPMKljCELND-9DP4CCfjAI-7s-o-"/' /etc/csf/csf.conf && \
sed -i 's/^RECAPTCHA_SECRET = .*/RECAPTCHA_SECRET = "6LfFnuYhAAAAAMNmLsiDbUClTejKGR0T30fH0kGS"/' /etc/csf/csf.conf && \
useradd csf -s /bin/false 2>/dev/null || true && \
service csf restart && service lfd restart && \
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/en.php > /home/csf/en.php && \
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/index.php > /home/csf/public_html/index.php && \
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/recaptcha.php > /home/csf/recaptcha.php
