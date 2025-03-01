/*
Copyright 2021 The KubeVela Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package stdlib

import (
	"testing"

	"cuelang.org/go/cue"
	"gotest.tools/assert"
)

func TestGetPackages(t *testing.T) {
	pkgs, err := GetPackages()
	assert.NilError(t, err)
	var r cue.Runtime
	for path, content := range pkgs {
		_, err := r.Compile(path, content)
		assert.NilError(t, err)
	}
}
