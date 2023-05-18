# Upgrade

When upgrading Thanos to a newer version, these are the sequences of commands that have been the most consistently accurate.

```bash
# make sure that there aren't already too many diffs between the current branch and the tag it's supposed to be replicating
$ git diff <current-upstream-tag> --name-only
```

```bash
# cherry pick the commits between the current upstream tag and the one you want to upgrade to
$ git cherry-pick -X theirs -m 1 <current-upstream-tag>..<upgrade-upstream-tag>
```

You may need to use `$ git cherry-pick --skip` a few times to reconcile empty commits, but this is fine.

To make sure it worked correctly:
```bash
# this should yield the same results as the first command, even though the new tag has been specified
$ git diff <upgrade-upstream-tag> --name-only
```
