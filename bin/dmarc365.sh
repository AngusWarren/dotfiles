#!/bin/bash

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "usage: $0 <fqdn> <tenancyID>"
    exit 1
fi

domain="$1"
tennant="$2"

if [[ -z "$2" ]]; then
    echo "usage: $0 <emaildomain> <365tennantname>"
fi

cat <<EOF
########## DMARC: _dmarc (_dmarc.${domain})
default:   "v=DMARC1; p=reject; pct=100; rua=mailto:dmarc.rua@dynamicit.net.au; ruf=mailto:dmarc.ruf@dynamicit.net.au; fo=0;"
currently: $(dig +short txt _dmarc.${domain})

########## SPF: @ (${domain})
default:   "v=spf1 include:spf.protection.outlook.com -all"
currently: $(dig +short txt ${domain} | grep spf)

EOF

for i in 1 2; do
    echo "########## DKIM: selector${i}._domainkey (selector${i}._domainkey.${domain})"
    echo "should be: selector${i}-$(echo ${domain} | tr '.' '-')._domainkey.${tennant}.onmicrosoft.com"
    echo "currently: $(dig +short selector${i}._domainkey.${domain})"
    echo
done

