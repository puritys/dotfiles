makecertv1() {
    sudo yum install openssl -y
    mkdir -p tmpkey
    cd tmpkey
    mkdir -p certs crl newcerts private


    openssl rand 2048 > ./private/.rand 
    chmod 600 ./private/.rand
    echo "0001" > serial
    touch index.txt

    pwd=`pwd`
    export TEMP_HOME=$pwd
    export TEMP_KEY=$pwd
    export TEMP_CONF=$pwd/../data/
    openssl req -new -x509 -keyout private/cakey.pem -out cacert.pem -days 3650 -config $TEMP_CONF/openssl.cnf 
    openssl req -nodes -new -x509 -keyout mykey.pem -out myreq.pem -days 365 -config $TEMP_CONF/openssl.cnf 
    openssl x509 -x509toreq -in myreq.pem -signkey mykey.pem -out tmp.pem
    openssl ca -config $TEMP_CONF/openssl.cnf -policy policy_anything -out mycert.pem -infiles tmp.pem

}

makecertv2() {
  name=$1
  OPENSSL=${OPENSSL:-openssl}
  COUNT=${COUNT:-100001}
  NPROCS=${NPROC:-$(getconf _NPROCESSORS_ONLN)}

  $OPENSSL genrsa -out ${name}.key 2048
  $OPENSSL req -new -key ${name}.key -out ${name}.csr \
    -subj /C=US/ST=CA/L=Norm/O=TrafficServer/OU=Test/CN=${name}
  $OPENSSL x509 -req -days 365 \
    -in ${name}.csr -signkey ${name}.key -out ${name}.crt
  cat ${name}.crt ${name}.key > ${name}.pem
}
makecertv2 "test.com"

