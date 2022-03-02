#!/bin/bash

#
# Copyright 2022 DataCanvas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


DINGO_ZIP=dingo.zip
if [ -f "$DINGO_ZIP" ] ; then
    mkdir tmp && unzip $DINGO_ZIP -d tmp/ 
    cp -r ./templates/conf/* ./tmp/conf/ 
    cp -r ./templates/bin/* ./tmp/bin/
    rm -rf ./tmp/conf/config.yaml && rm -rf ./tmp/conf/logback.xml
else
    echo "$DINGO_ZIP does not exist, please copy the dingo.zip to artifactory"
    exit -1
fi

# Archive the dingo.zip package
cd ./tmp && zip -r dingo.zip * && cp dingo.zip .. && cd .. && rm -rf tmp