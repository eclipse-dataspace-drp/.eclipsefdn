local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.dataspace-drp', 'eclipse-dataspace-drp') {
  settings+: {
    description: "",
    name: "Eclipse Dataspace DRP",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('DataRightsProfile') {
      allow_merge_commit: false,
      allow_rebase_merge: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "The Dataspace Data Rights Policy Profile contains specifications for data rights holders in context of data ecosystems, enabling them to excercise their data rights",
      has_discussions: true,
      has_issues: true,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main'){
          required_approving_review_count: 1,
          requires_pull_request: true,
          requires_status_checks: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
