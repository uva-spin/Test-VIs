# variable_sharing

To test a reasonable method of sharing variables between VIs and/or projects.


## Situation

* We are creating one project per device.
* We plan to execute multiple projects/VIs on the target computer.
* Each project has to know spill ID, BOS & EOS.
* The variables are set by one VI (`bos_eos_mostreal_atBOS.vi`).


## Required Specification

* A few variables (like spill ID, BOS & EOS)
* With a letency of 0.5 seconds?
    * Should be fine for VIs on the target computer.
    * Not fine for VIs on the NMR computer?  0.1 s?
* Communication on local computer and also over network.
    * Actually the commnication over network will be necessary for the NMR computer?

## Desired Specification

* Any client project, which only reads the variable, can be opened and executed even when the variables are not available or defined.
  It is because a client project is sometimes tested/developed separately.


## Methods Tested

1. `with_global_var`:  Using the `global` variable.
    * Variables are stored in `Global.vi`.
    * Client projects cannot be opened nor executed without `Global.vi`.
1. `with_shared_var`:  Using the `shared` variable.
    * Variables are stored in `E1039TargetComputerShared.lvlib` of `setter.lvproj`.  The variable type must be "Network-Published".
    * Client projects cannot be opened nor executed without lvlib.
1. `with_tcp_ip`:  Using the TCP/IP communication.
    * The network address+port and the format of communication strings have to be matched between server and client.
    * The over-network communication is possible.


## Tentative Conclusion

* All the methods tested are possible
* I prefer the TCP/IP connection since only it satisfies the desired spec.  The usage is for example;


## To-Do List

* n/a
