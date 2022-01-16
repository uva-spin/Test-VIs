# variable_sharing/with_tcp_ip

The variables sent over TCP/IP are `BOS` (boolean), `EOS` (boolean) and `spill_id` (integer).
They are sent as an ASCII string.


## Communication Flow

A client initiates a connection when it needs the spill information.
The server opens a port (or multiple ports) to wait for connections.
The server has two modes about the timing when it sends the variable to clients; ASAP and BOS.
In the ASAP mode, the server sends out the variables as soon as possible.
In the BOS mode, the server waits for the BOS status raised and then sends out the variables.

The ASAP mode should be used for a client that just performs a measurement regularly, like once per 10 seconds.
One ASAP-mode server can handle multiple clients, because one connection finishes in a short time.

The BOS mode should be used for a client that requires precise synchronization with BOS.
Such client is only the PDP at present.
One BOS-mode server can handle only one client, because one connection occupies the port of the server.
Multiple servers, using different ports, should be defined for multiple clients.


## Server-Side Configuration

* `sub/spill_param_tcp_server.vi`:
    Sub VI that contains the main server function.
* `tcp_server.vi`:
    An example of main VI that runs two servers.
    One server is in the ASAP (instant) mode, using port 9999.
    The other server is in the BOS mode, using port 9991.
    The bottom while loop handles `BOS`, `EOS` and `spill_id`.


## Client-Side Configuration

* `sub/spill_param_tcp_client.vi`:
    Sub VI that contains the main client function.
* `tcp_client.vi`:
    An example of main VI that runs three clients.
    Twe are in the ASAP mode.  The other is in the BOS mode.
* `tcp_client_many.vi`:
    An example of main VI that runs 10 ASAP-mode clients.
* `tcp_client_meas_time.vi`:
    A test VI that measures the times for TCP Open, Read and Close.
