1. etcdがclusteringされていることの確認
    ```
    # etcdctl member list -w table
    ```
1. PostgreSQLがreplicationされていることの確認
    ```
    # patronictl -c /etc/patroni/patroni.yml list
    ```
1. HAProxy経由でPostgreSQLに接続できることの確認
    ```
    # Leader node
    $ psql -U testuser -h 192.168.105.54 -p 5000 testdb
    # Follower node
    $ psql -U testuser -h 192.168.105.54 -p 5001 testdb
    ```
1. Leader nodeをswitch overさせる
    ```
    # patronictl -c /etc/patroni/patroni.yml failover
    ```
1. Leader nodeのpatroniをdownさせる
    ```
    # systemctl stop patroni
    ```
1. PrimaryのHAProxyをdownさせる
    ```
    # systemctl stop haproxy
    ```
