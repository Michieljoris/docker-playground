curl -XPUT localhost:5984/testdb
curl -XPUT localhost:5984/testdb/test -d'{"f1": 1, "f2": 2, "f3": 3}'
curl -XPUT localhost:5984/testdb/test1 -d'{"f1": 1, "f2": 4, "f3": 3}'
curl -XPUT localhost:5984/testdb/test2 -d'{"f1": 1, "f2": 7, "f3": 8}'


curl "http://localhost:5984/testdb/_changes?include_docs=true"


# curl localhost:5984/testdb/_changes?fields=f1&include_docs=true
curl localhost:5984/testdb/_changes?include_docs=true&fields=f1
