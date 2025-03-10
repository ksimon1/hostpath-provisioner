#Copyright 2021 The hostpath provisioner Authors.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

GOLANG_VER=${GOLANG_VER:-1.20.10}

function setGoInProw() {
  if [[ -v PROW_JOB_ID ]] ; then
    export GIMME_HOSTARCH=amd64
    export GIMME_ARCH=${GOARCH}
    eval $(gimme ${1})
    cp -R ~/.gimme/versions/go${1}.linux.amd64 /usr/local/go
  fi
}
