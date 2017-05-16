#!/bin/bash

cat > cities-deployment.json <<EOF
{
  "apiVersion": "extensions/v1beta1",
  "kind": "Deployment",
  "metadata": {
    "name": "cities"
  },
  "spec": {
    "replicas": 3,
    "selector": {
      "matchLabels": {
        "name": "cities",
        "deployment": "${WERCKER_GIT_COMMIT}"
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "cities",
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "ravibhim/golang-example:${WERCKER_GIT_COMMIT}",
            "name": "cities",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 5000,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    }
  }
}
EOF
