/*
  Root package for modelbase-development. Imports all project packages.
  Convention: root-<name>.sysml contains package Project<NamePascalCase> that
  imports requirements, deploy, behaviour. List this file last in config.yaml.
*/
package ProjectModelbaseDevelopment {
  private import ModelbaseDevelopmentRequirements::*;
  private import ModelbaseDevelopment::*;
  private import ModelbaseDevelopmentBehaviour::*;
}
