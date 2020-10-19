package out

Terminals: [{
	Description: "The main terminal"
	Scenarios: {
		go115: {
			Image: "playwithgo/go1.15.2@sha256:4f5346af0d93f50c974d9be2f2f31c55d2f953da9437aac990d30a50e3d591a5"
		}
	}
	Name: "term1"
}]
Scenarios: [{
	Description: "Go 1.15"
	Name:        "go115"
}]
Networks: ["playwithgo_pwg"]
Env: []
Langs: {
	en: {
		Hash: "2bffab5a6ec2e3ee8a09a5ce5b17cd4f59e407b82e8b65e822de4ee4fd1681bc"
		Steps: {
			run_hello_again: {
				Stmts: [{
					TrimmedOutput: "Don't communicate by sharing memory, share memory by communicating."
					Output: """
						Don't communicate by sharing memory, share memory by communicating.

						"""
					ExitCode: 0
					CmdStr:   "go run hello.go"
					Negated:  false
				}]
				Order:    8
				Terminal: "term1"
				StepType: 1
				Name:     "run_hello_again"
			}
			gogetquote: {
				Stmts: [{
					TrimmedOutput: """
						go: downloading rsc.io/quote v1.5.2
						go: downloading rsc.io/sampler v1.3.0
						go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
						"""
					Output: """
						go: downloading rsc.io/quote v1.5.2
						go: downloading rsc.io/sampler v1.3.0
						go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c

						"""
					ExitCode: 0
					CmdStr:   "go get rsc.io/quote@v1.5.2"
					Negated:  false
				}]
				Order:    7
				Terminal: "term1"
				StepType: 1
				Name:     "gogetquote"
			}
			update_hello: {
				Order: 5
				Source: """
					package main

					import "fmt"

					import "rsc.io/quote"

					func main() {
					\tfmt.Println(quote.Go())
					}
					"""
				Renderer: {
					Pre: """
						package main

						import "fmt"

						func main() {
						\tfmt.Println("Hello, World!")
						}
						"""
					RendererType: 3
				}
				Language: "go"
				Target:   "/home/gopher/hello/hello.go"
				Terminal: "term1"
				StepType: 2
				Name:     "update_hello"
			}
			run_hello: {
				Stmts: [{
					TrimmedOutput: "Hello, World!"
					Output: """
						Hello, World!

						"""
					ExitCode: 0
					CmdStr:   "go run hello.go"
					Negated:  false
				}]
				Order:    4
				Terminal: "term1"
				StepType: 1
				Name:     "run_hello"
			}
			create_hello: {
				Order: 3
				Source: """
					package main

					import "fmt"

					func main() {
					\tfmt.Println("Hello, World!")
					}
					"""
				Renderer: {
					RendererType: 1
				}
				Language: "go"
				Target:   "/home/gopher/hello/hello.go"
				Terminal: "term1"
				StepType: 2
				Name:     "create_hello"
			}
			mkdir_hello: {
				Stmts: [{
					TrimmedOutput: ""
					Output:        ""
					ExitCode:      0
					CmdStr:        "mkdir /home/gopher/hello"
					Negated:       false
				}, {
					TrimmedOutput: ""
					Output:        ""
					ExitCode:      0
					CmdStr:        "cd /home/gopher/hello"
					Negated:       false
				}]
				Order:    2
				Terminal: "term1"
				StepType: 1
				Name:     "mkdir_hello"
			}
			pwd_home: {
				Stmts: [{
					TrimmedOutput: "/home/gopher"
					Output: """
						/home/gopher

						"""
					ExitCode: 0
					CmdStr:   "pwd"
					Negated:  false
				}]
				Order:    1
				Terminal: "term1"
				StepType: 1
				Name:     "pwd_home"
			}
			goversion: {
				Stmts: [{
					TrimmedOutput: "go version go1.15.2 linux/amd64"
					Output: """
						go version go1.15.2 linux/amd64

						"""
					ExitCode: 0
					CmdStr:   "go version"
					Negated:  false
				}]
				Order:    0
				Terminal: "term1"
				StepType: 1
				Name:     "goversion"
			}
			gomodinit: {
				Stmts: [{
					TrimmedOutput: "go: creating new go.mod: module hello"
					Output: """
						go: creating new go.mod: module hello

						"""
					ExitCode: 0
					CmdStr:   "go mod init hello"
					Negated:  false
				}]
				Order:    6
				Terminal: "term1"
				StepType: 1
				Name:     "gomodinit"
			}
		}
	}
}
Delims: ["{{{", "}}}"]
