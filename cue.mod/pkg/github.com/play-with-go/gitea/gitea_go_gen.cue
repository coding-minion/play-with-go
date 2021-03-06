// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/play-with-go/gitea

package gitea

#NewUser: {
	Repos: [...#Repo] @go(,[]Repo)
}

#Repo: {
	// Var is the variable name to use for the repository
	Var: string

	// Pattern specifies the name pattern of the repository. The respository
	// name is generated by taking Pattern and applying a random string to the
	// end. If Pattern includes a "*", the random string replaces the last "*"
	Pattern: string

	// Private indicates whether the repo should be private or not
	Private: bool
}
