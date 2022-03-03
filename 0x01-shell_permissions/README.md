## My name is Betty
[0-iam_betty](./0-iam_betty) script that switches the current user to the user betty.
## Who am I
[1-who_am_i](./1-who_am_i) script that prints the effective username of the current user.
## Groups
[2-groups](./2-groups) script that prints all the groups the current user is part of.
## New owner
[3-new_owner](./3-new_owner) script  that changes the owner of the file hello to the user betty.
## Empty file
[4-empty](./4-empty) script that create an empty file.
## Execute
[5-execute](./5-execute) scripts that adds execution permission to file 'hello'.
## Multiple permissions
[6-multiple_permissions](./6-multiple_permissions) script that adds execute permission to the owner and the group owner, and read permission to other users, to the file hello.
## Everybody!
[7-everybody](./7-everybody) script that adds execution permission to the owner, the group owner and the other users, to the file hello.
## James Bond
[8-James_Bond](./8-James_Bond) script that sets the permission to the file hello as follows:
- Owner: no permission at all
- Group: no permission at all
- Other users: all the permissions
## John Doe
[9-John_Doe](./9-John_Doe) that sets the mode of the file hello to this: ## -rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello
## Look in the mirror
[10-mirror_permissions](./10-mirror_permissions) script that sets the mode of the file hello the same as olleh’s mode.
## Directories
[11-directories_permissions](./11-directories_permissions) script that adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users. Regular files should not be changed.
## More directories
[12-directory_permissions](./12-directory_permissions) script that creates a directory called my_dir with permissions 751 in the working directory.
## Change group
[13-change_group](./13-change_group) script that changes the group owner to school for the file hello.
## Owner and group
[100-change_owner_and_group](./100-change_owner_and_group) script that changes the owner to vincent and the group owner to staff for all the files and directories in the working directory.