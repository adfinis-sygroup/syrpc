=====
syrpc
=====

Python:

.. image:: https://travis-ci.org/adfinis-sygroup/syrpc-python.svg?branch=master
   :target: https://travis-ci.org/adfinis-sygroup/syrpc-python

Nodejs:

.. image:: https://travis-ci.org/adfinis-sygroup/syrpc-js.svg?branch=master
   :target: https://travis-ci.org/adfinis-sygroup/syrpc-js

SyRPC - RPC for stateless backends

SyRPC supports stateless backends using result_id.

::

      ____   __ 
     |    | |==|
     |____| |  | Web Client
     /::::/ |__|
      |
      |   http get /        .-----------------------.
      |-------------------->|      Backend(0)       |
      |                     | put_request(          |         .-------------------.
      | rendered page       |    'echo',            |         |      Server       |
      | including result_id |    {'value': 'hello'} |-------->| (                 |
      |<--------------------| )                     |         |     type_,        |
      |                     '-----------------------'         |     result_id,    |
      |                                                       |     data          |
      |                                                       | ) = get_request() |
      |    ajax get /echo   .-----------------------.         |                   |
      |-------------------->|      Backend(1)       |-------->| put_request(      |
      |                     | get_result(result_id) |         |     result_id,    |
      |    echo data        |                       |         |     data          |
      |<--------------------|                       |<--------| )                 |
      |                     '-----------------------'         |                   |
      |                                                       '-------------------'
      v

Collisions on the queues (too many rejects) are reduced by using a hash-table
of queues, by default 64 queues. The hash module 64 of the result_id is used to
identify the result_queue. This makes SyRPC compatible with 12 Factor
Applications, but has still quite good performance.

Install
-------

Python::

   pip install syrpc

Nodejs::

   npm install syrpc

PHP::

   composer require adfinis-sygroup/syrpc-php
