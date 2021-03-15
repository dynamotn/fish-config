set -q FZF_GIT_COMMIT_SEARCH_COMMAND; or set -U FZF_GIT_COMMIT_SEARCH_COMMAND "git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
set -q FZF_GCLOUD_PROJECT_SWITCH_COMMAND; or set -U FZF_GCLOUD_PROJECT_SWITCH_COMMAND "gcloud config set project \$project_id"
set -q FZF_GCLOUD_PROJECT_SEARCH_COMMAND; or set -U FZF_GCLOUD_PROJECT_SEARCH_COMMAND "gcloud projects list --format='table[no-heading](projectId,name)'"
set -q FZF_GCLOUD_INSTANCE_SEARCH_COMMAND; or set -U FZF_GCLOUD_INSTANCE_SEARCH_COMMAND "gcloud compute instances list | tail -n +2"
