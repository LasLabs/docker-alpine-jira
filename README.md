[![License: Apache 2.0](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/LasLabs/docker-alpine-confluence.svg?branch=master)](https://travis-ci.org/LasLabs/docker-alpine-confluence)

[![](https://images.microbadger.com/badges/image/laslabs/alpine-jira.svg)](https://microbadger.com/images/laslabs/alpine-jira "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/laslabs/alpine-jira.svg)](https://microbadger.com/images/laslabs/alpine-jira "Get your own version badge on microbadger.com")

Docker Alpine Jira
==================

This image provides Jira built on Alpine Linux

Configuration
=============

*

Usage
=====

* 

Build Arguments
===============

The following build arguments are available for customization:


| Name | Default | Description |
|------|---------|-------------|


Environment Variables
=====================

The following environment variables are available for your configuration
pleasure:

| Name | Default | Description |
|------|---------|-------------|
| `PROXY_NAME` |  | Enable proxy mode and define the domain that is being served on (``www.example.com``). |
| `PROXY_PORT` | 443 | If proxy mode is enabled, this is the port that the proxy is serving on. |
| `PROXY_SCHEME` | https | If proxy mode is enabled, this is the scheme the proxy is serving on (``http`` or ``https`` typically). |

Known Issues / Roadmap
======================

*

Bug Tracker
===========

Bugs are tracked on [GitHub Issues](https://github.com/LasLabs/docker-alpine-confluence/issues).
In case of trouble, please check there to see if your issue has already been reported.
If you spotted it first, help us smash it by providing detailed and welcomed feedback.

Credits
=======

Contributors
------------

* Dave Lasley <dave@laslabs.com>

Maintainer
----------

[![LasLabs Inc.](https://laslabs.com/logo.png)](https://laslabs.com)

This module is maintained by [LasLabs Inc.](https://laslabs.com)

* https://github.com/LasLabs/docker-alpine-confluence
