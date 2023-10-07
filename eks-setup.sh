# this updates your local eks config with all environemnt and regions eks cluster 

update_eks () {
	aws eks --profile $1 --region $2 list-clusters | jq -r '.clusters[]' | while read cluster; do 
		aws eks --profile $1 --region $2 update-kubeconfig --name $cluster --alias $cluster;
	done;
}

update_eks dev us-east-1

update_eks prod us-east-1
update_eks prod us-west-2
