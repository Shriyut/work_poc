#!bin/ash

cat > /etc/docker/daemon.json << EOF

{
        "insecure-registries" : ["35.239.152.57"]
}

EOF
