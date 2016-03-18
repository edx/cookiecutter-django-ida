## For the Submitter
Please make sure that you have followed all of the steps below, as
it will help your PR be merged smoothly. Feel free to remove any
sections that won't be relevant to reviewers of your PR, including this
one.

Anything marked with `TODO:` is something that you, the developer, should
do as part of the PR.

The PR submission process is described in [more detail here.](http://edx.readthedocs.org/projects/edx-developer-guide/en/latest/process/index.html)

### Testing
- TODO: Include unit, integration, acceptance tests as appropriate
- TODO: Include accessibility (a11y) tests
- TODO: Include tests that capture the external-query scaling properties
- [ ] Check that Database migrations are backwards-compatible
- [ ] Manually test right-to-left languages and i18n
  of the changes.

### DevOps assistance
If it's needed, or even if you suspect it might be needed, do any/all these
things as early as possible. Don't surprise devops right before merging!
For example, touching envs/aws.py or or envs/common.py are dead giveaways
that you'll need assistance when pushing your changes out.

Things that require devops attention include, but are not limited to:
- configuration changes
- feature flags
- migrations

Ways to get devops attention, pick-and-choose whichever is most appropriate for your specific PR:
- TODO: Tag devops on your PR (user `edx/devops`), either for review (more specific to devops = better) or just a general FYI
- TODO: File a support ticket

FYI: Tag anyone who might be interested in this PR here.

### Documentation considerations
- Are there user visible changes? If so, describe which users. Consider learners, course teams,
  researchers, installers/maintainers, and developers.
- Your commit messages will be the first draft used for release notes. Please include a meaningful
  subject line, and a detailed body if more explanation is needed.

### Post-review
- TODO: Squash commits into discrete sets of changes (see the note about release notes above)

## Description

TODO: Include a detailed description of the changes in the body of the PR

## Manual Test Plan

TODO: Include instructions for any required manual tests, and any manual testing that has
already been performed.

## Reviewers
If you've been tagged for review, please check your corresponding box once you've given the :+1:.
- [ ] Code review #1 (TODO: tag a specific user)
- [ ] Code review #2 (TODO: tag a specific user)
- [ ] Docs review (required for UI strings/error messages)
- [ ] UX review
- [ ] Accessibility review
- [ ] Product review

### Areas to Consider
- [ ] i18n 
    - Are all user-facing strings tagged?
- [ ] Right-to-left
    - Will the feature work for right-to-left languages?
- [ ] Analytics
    - Are any new events being emitted?
    - Have any events been changed?
    - Are there any new user actions that should be emitted as events?
- [ ] Performance
    - What dimensions does this change scale over? Users? Courses? Course size?
    - How does the feature scale over those dimensions? Sub-linear? Linear? Quadratic? Exponential?
    - How does the scaling affect the number of external calls (database queries,
      api requests, etc) that this code makes?
- [ ] Database migrations
    - Are they backwards compatible?
    - When they run on production, how long will they take? Will they lock the table?

