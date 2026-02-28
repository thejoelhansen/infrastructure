# Test Registry

test_registry() {
  curl http://localhost:30069/v2/
  kubectl get pods -n kube-system
}

deploy_dyndns() {
# !! SOMETHING IS WRONG HERE IDK WAHT	
	# Option to prune of supplied
	prune=$1	
	if [ $1 = "prune" ]; then 
		podman image prune -a -f
	fi	
	# TEST HERE ALSO exit 1 or 0 here if sourced function fro shell is like running exit AT YOUR shell cuz your running in your shell, unlike the subshell of running a .sh file loooool	
# VERIFY BUILD COMMAND	
	# Build or pull an image
	podman build Dockerfile -t dyndns:latest .

	# Tag it for your local registry
	# podman tag dyndns:latest localhost:30069/dyndns:latest

	# Push to your registry
	podman push localhost:30069/dyndns:latest
}

nuke_dynds_jobs() {
	kubectl get jobs -n default
	kubectl delete jobs -l job-name=dyndns -n default
	
	# yikes
	# kubectl delete jobs --all -n default
	
	# failed jobs
	kubectl delete jobs --field-selector status.successful=0 -n default
}
