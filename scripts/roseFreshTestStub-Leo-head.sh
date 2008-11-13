#!/bin/bash

# Stub file to include settings for roseFreshTest-common

#required by make docs!
source /usr/apps/graphviz/2.6/setup.sh
#export PATH="/usr/apps/java/jdk1.5.0_11/bin:$PATH"
#export LD_LIBRARY_PATH="/home/dquinlan/ROSE/OpenFortranParser/ofp_install/lib/:$LD_LIBRARY_PATH"

export JAVA_HOME=/usr/apps/java/jdk1.5.0_11
export BOOST_ROOT="/home/liao6/opt/boost_1_35_0"
export LD_LIBRARY_PATH="/usr/apps/java/jdk1.5.0_11/lib:${JAVA_HOME}/jre/lib/i386/server:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}"

source /usr/apps/gcc/4.2.2/setup.sh
export PATH="$JAVA_HOME/bin:/usr/apps/automake/1.9.6/bin:$PATH"

# using a time stamp to avoid overwriting previous tests
TIMESTAMP=$(date +%Y%m%d_%H%M%S) 
ROSE_TOP=/home/liao6/daily-test-rose/${TIMESTAMP}

# for regular build and tests
CONFIGURE_FLAGS=(--with-boost=${BOOST_ROOT} --enable-dq-developer-tests --with-ROSE_LONG_MAKE_CHECK_RULE=yes --with-CXX_DEBUG=-g --with-C_DEBUG=-g --with-CXX_WARNINGS=-Wall --prefix=${ROSE_TOP}/install "$@")

ROSE_SVNROOT=file:///usr/casc/overture/ROSE/svn/ROSE/trunk/ROSE
MAILADDRS="liaoch@llnl.gov willcock2@llnl.gov panas2@llnl.gov quinlan1@llnl.gov"

# the right version of subversion is essential!!
SVN=/nfs/apps/subversion/1.5.1/bin/svn
#SVN=/nfs/apps/subversion/1.4.5/bin/svn
SVNOP=checkout
# check out the revision of the past 11:00pm PDT (06:00am UTC)
# using data as revision number needs {}
# default is head
#SVNVERSIONOPTION="{`date -d '06:00Z' -u '+%FT%H:%M:%SZ'`}"
#SVNVERSIONOPTION=1303

# How many processes for make
MAKEFLAGS="-j16"

ENABLE_BUILD_BINARY_EDG=1

# my additional stuff
ENABLE_UPLOAD_SVN=1
ENABLE_UPLOAD_WEB=1

#KEEP_TEST_DIR=1
NORMAL_INSTALL_DIR=1 # no chmod 000 for 'install'

set -e
set -o pipefail
