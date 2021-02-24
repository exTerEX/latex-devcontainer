# R development container for VSCode

A LaTeX development container for [Visual Studio Code](https://code.visualstudio.com/) with [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. It is a linux environment based on Ubuntu. It contains `texlive` and has [Oh-my-bash](https://ohmybash.nntoan.com/).


## Example

To use as development container for your project create `.devcontainer/devcontainer.json` to project with the content,

```json
{
    "name": "",
	"updateRemoteUserUID": false,
    "image": "exterex/latex-dev",
    "extensions": [
        "james-yu.latex-workshop"
    ]
}
```

To customize user in container use,
```json
{
    "containerUser": "vscode",
    "updateRemoteUserUID": false
}
```

in additon to the codeblock above. `"updateRemoteUserUID": false` prevents container to rebuild to update GID/UID if `containerUser` or `remoteUser` is specified.

For configuration of `devcontainer.json` see [code.visualstudio.com](https://code.visualstudio.com/docs/remote/devcontainerjson-reference)

## Build

The image is updated every time the `main` branch of the repository is updated and on a fixed schedule (see [workflows/ci.yml](.github/workflows/ci.yml)).

## License

This repository is distributed under `MPL-2.0`. For more information see [LICENSE](LICENSE).