#!/bin/bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install kubelet kubeadm kubectl -y

# install aws-iam-authentication
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator
curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator.sha256
openssl sha1 -sha256 aws-iam-authenticator
sudo chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
aws-iam-authenticator help

# add kubeconfig file
mkdir -p ~/.kube
echo "
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNU1ERXlNakF3TURneE5sb1hEVEk1TURFeE9UQXdNRGd4Tmxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTFAvClViMHZoMnhTN3l3ZXk3MGNRMkhGQWw0TTg0N1diVU5LVXBkeS84QVhqWUtUQUs1T1Jqc3Y0Z2VTOVJ4MWdwN1YKbkVsOGozN3JsT2p4U1ROZW1BOUNpenlZdFR0SEIwWVJKTGovUlRlQ3IwbUhiZzhYSXUwSjJmWkhtM3RZdFhJTQpwSnBxMHMyQ1loNWpyYXYybGprQ284dHE3UFNGUkRKdHQybk16dVoyb3RQL1ZKNGp1TDY4dEE1Sm5VdWNiOUliCjR4Y3R5WXdvbUdHZEl3WE1HRldhWHkvL0RTWHQyMWdTQVJ0dlN1eEdZamlneE9MaWpDdnA4ZU56N2kyK25TVWcKY3oyYUF2V0lpN1ZYYnhLT2cyd1Z2WGFqMUx5cmY5VVlPTm9yN1VsS0hQeDJhWGMxL1hNQVZNSWxpUXo1cVRIRwpEUVg2dmVqWGlKZUJOYS9qczdjQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFGTGwwd3JDeU83bU9TSm9pQmpDeVhZQkc5VU0Kc3U2YVZEZlBMaVd6N2g5R0JjUGs4VnpzMmdYQ3kwRmhQc0Q0WC9QTk5VS3Z3MjY1KzlLeWIwWUdNRG55WjlCUApQekpERk5pREg1bDZ0bGFKUTNWRG1YWHFNRC9Oa2FKMUVJN0htMVlLNnZISTZpaVU5TnlZRjNwbytSTnJnVnpyClE0SXM1MXY1Q1V1a242QW11ZTFtZnB3NDdybmMrWkd3ZmdESmxqc1F5ZUhJWWhXUnhEOHRwK2hIRTg0Z2RlTDkKTGxxTnYzb2FMS1pmYUp3QUgxQ1BZNFVZTFFManZGeEVBaGVPRG1mL002d2ZQMko1UjcxYkRqbjlUc0RXUUJQZApCTHpTQ2o3eG1MOTZBNHBZeU5DaXpOa3A0TURjc3FrRFBwc01seFoxSzN6RGR4T1B6OGp5TU0zQko5Zz0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    server: https://6D30588A94C103C0D14A05F4EC341050.sk1.us-west-2.eks.amazonaws.com
  name: eks_test
contexts:
- context:
    cluster: eks_test
    namespace: test
    user: eks_test
  name: eks_test
current-context: eks_test
kind: Config
preferences: {}
users:
- name: eks_test
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - eks_test
      command: aws-iam-authenticator
      env:
      - name: AWS_PROFILE
        value: test
" >> ~/.kube/kubeconfig

echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/kubeconfig' >> ~/.bashrc
