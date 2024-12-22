#!/bin/bash
echo "Waiting for MongoDB to start..."
until mongosh --host mongodb:27017 --eval "print(\"waited for connection\")"
do
    sleep 1
done

echo "Initializing MongoDB replica set..."
mongosh --host mongodb:27017 <<EOF
rs.initiate({
  _id: "rs0",
  members: [ { _id: 0, host: "mongodb:27017" } ]
})
EOF

echo "MongoDB replica set initialized"
