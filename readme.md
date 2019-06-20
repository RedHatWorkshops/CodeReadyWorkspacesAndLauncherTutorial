# Application Development with Red Hat CodeReady Workspaces and Launcher

## Table of Contents

### Installation

* [Install CodeReady Workspaces on OpenShift Cluster](InstallingCodeReadyWorkspacesOnOpenShift.md)
* [Install Launcher on OpenShift Cluster](InstallLauncherOnOpenShift.md)

### Labs

* [Using Launcher to generate code](GenerateCodeUsingLauncher.md)
* [Editing code using CodeReady workspaces ](EditCodeUsingCodeReadyWorkspaces.md)
* [Debugging code using CodeReady workspaces](DebuggingUsingCodeReadyWorkspaces.md)
* [Creating Factories](CreatingFactory.md) 

### Notes for RHPDS Users

The labs above assume Launcher and CodeReady Workspaces are deployed on the same OpenShift cluster, and that
Launcher is configured to deploy to an OpenShift cluster. However, the RHPDS catalog item does not yet
deploy a version of Launcher, and it does not provide OpenShift console access. Instead, the Red Hat Developers
Launcher can be used to generate and download code. Deployment of that code to an OpenShift cluster
is optional and is not required by CodeReady Workspaces.

RHPDS users can work through the labs above, additionally doing the following:

1. Skip the steps for installing CodeReady Workspaces and Launcher. CodeReady Workspaces has already been installed
for you and instructions to access it have been provided via email

2. Open and login to the [Red Hat Developers Launcher](http://developers.redhat.com/launch), and follow
the steps to create a backend application as detailed in [Using Launcher to generate code](GenerateCodeUsingLauncher.md)

3. After configuring the project in Launcher, click the `Download` button

4. In your personal GitHub account, create a repository with the code you downloaded

5. Optionally, if you have access to an OpenShift cluster, deploy the code from the repo you just created using the Java S2I
image

6. Optionally, create a web hook in GitHub with the secret in the application build to trigger new builds on code push

7. Continue on with the next lab, [Editing code using CodeReady workspaces](EditCodeUsingCodeReadyWorkspaces.md)
