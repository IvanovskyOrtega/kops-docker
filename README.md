# kops-docker

## Description

A Docker image created to run Kops on unprivileged environments.

## Usage

Pull the image:

```bash
$ docker pull ivanovskyortegavich/kops-docker:0.0.1
```

Run the image (example for aws):

```bash
$ docker run --rm -it \
  -e KOPS_STATE_STORE="KOPS_STATE_STORE" \
  -v "$HOME"/.aws/credentials:/home/kops/.aws/credentials:ro \
  -v "$HOME"/.kube/config:/home/kops/.kube/config:rw \
  -v "$(pwd)":/workdir \
  -w /workdir \
  ivanovskyortegavich/kops-docker:0.0.1
kops@f16acb3a81fb:/workdir$ kops get ig
```

### Autor

* @IvanovskyOrtega ivanovskyortega@gmail.com
