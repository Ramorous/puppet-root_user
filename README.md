# root_user

####Table of Contents
1. [Overview](#overview)
2. [Module Description - Why is this useful?](#module-description)
3. [Setup - The basics of getting started with root_user](#setup)
    * [Setup requirements](#setup-requirements)
4. [License](#license)

##Overview

Allows setting root password for specific hosts.

##Module Description

This module will allow you to set a host's root password.

This module was tested and works great within RedHat Satellite 6.1.

##Setup

##Setup Requirements

##Beginning with run once

```puppet
    root_user {
      "class_enabled" => false,
	  "password" => "SomePassword",
	  "enc_type" => "SHA-512",
	  "enc_salt" => "SomeSalt",
    }
```

    class_enabled  (Boolean: default [false])
    - Enables/Disables the process
    password (String: default undefined)
    - The password
    enc_type (String: default SHA-512)
    - Choice of MD5, SHA-256, SHA-512
    enc_salt (String default "root_user")
    - Salt for Password Encryption

##License

Copyright 2015 Eric B

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
