In the merge commit message add json stanza based on the example below.  On the github UI when doing the merge this stanza would be in the additional message box and not in the header message which is auto generated

note the json stanza should be delimited with `---` before the json stanza and `===` after it


```
	---
	{"versioning": 
	   [
	      {"module": "API", "release": "MAJOR"},
	      {"module": "UI","release": "PATCH"}
	    ]
	}
	===
```

The workflows parse the yaml using the following command
`git log --format=%B -n 1 HEAD | tail -n+3 | yq '.versioning[] | select(.module == "API") | .release'`