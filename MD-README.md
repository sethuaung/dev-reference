# vercel-mkdocs-wrapper

This repo allows quickly hosting a folder of markdown notes online.
It has been designed for [vercel](https://vercel.com/), but will probably also work well for other hosting providers.
It uses the [mkdocs](https://www.mkdocs.org/) static site generator, which has some nice features such as a search function.


## Setup

1. Create a fork of this repo (optional, but strongly recommended).
   I may push breaking changes to this repo.
   Maintaining your own fork also allows you to make changes to the template (for example using a different theme).
2. If you don't do it already, put your notes in a git repo and push it to a git hosting service like Gitlab, Github, etc
3. Create a new vercel project and import (your fork of) this repo.
4. In the vercel project go to `Settings` -> `Environment Variables` and add a `DOCS_REPO` variable, that points to the git repo containing your notes. Example value: `https://github.com/six-two/notes-demo-page`
   If your repo is private, you will need to specify create an API token and put it in the git url. Example for private repo: `https://oauth2:YOUR-API-TOKEN-HERE@gitlab.com/six-two/private-notes-demo`
5. Optional: Name your website by also creating a `DOCS_NAME` variable.
6. Redeploy your vercel project (`Deployments` -> Choose the top one -> Three dot menu next to `Visit` -> `Redeploy` -> `Redeploy`)
7. Optional: Add a custom domain (`Settings` -> `Domains`)

If you have multiple markdown folders / repos, you can repeat the steps above (except for the first one) for each folder.

## Update an existing site

To update an existing site, you can either redeploy your vercel project manually, or push a commit on your fork of the template.
Your site will *NOT* automatically be updated, when you push a commit your notes folder.
If you want that behavior, you should instead create a mkdocs project out of your repo and create a vercel project for that.
This repo just helps you host a plain folder of markdown files.

## How it works

By default, vercel executes `npm run build`.
The included `package.json` defines this as just calling the local `./build.sh` file.
This build script obtains the repo path from the environment variable, clones the repo into the `docs` folder, and runs `mkdocs build`.
For more details look at the source of `build.sh`, which is pretty well commented.
The resulting site is written to the `public` directory, which is where vercel looks for it by default.
