# Modelbase Development

**Purpose:** A modelbase (reference model) for **model-based development**: the workflow and iteration across software development, hardware development, mechanism development, and system deployment.

## Roles

### Modelbase (central role)

The **modelbase** is the single source of truth for the system model and the development plan. Its roles:


| Role          | Responsibility                                                                                                                           |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Holds**     | The SysML model (requirements, structure, behaviour) and the development plan (to do).                                                   |
| **Generates** | The development plan from the model. Plan is versioned (Plan version + change note required at each update).                             |
| **Publishes** | The plan to the implement side as the implementation guide for each iteration.                                                           |
| **Receives**  | The implement report (alignment, gaps, traceability) from the implement side after each iteration.                                       |
| **Decides**   | **Only the modelbase** decides whether an iteration is done (scope delivered and acceptable).                                            |
| **Updates**   | The plan for the next iteration when it decides done (new scope, promote backlog, or close); updates model when needed (e.g. from gaps). |


Gaps are maintained in the implement-side repo; the modelbase keeps only a pointer (e.g. `outputs/<project>-GAPS.md`).

### Implement side

The **implement side** implements against the plan and model, and delivers the report. It **does not** decide if an iteration is done.

- **Implements** development (software, hardware, mechanism, and/or deployment) against the current plan and model.
- **Produces and delivers** the implement report (iteration block, alignment, gaps, traceability) to the modelbase.
- **Uses** the updated plan from the modelbase to start the next iteration.

Per domain the implement side may be named e.g. **codebase** (software), **hardware repo**, **mechanism repo**, **deployment repo**.

## Scope

- **Software development** — design and implementation of software against the model and plan.
- **Hardware development** — design and implementation of electronics/PCBA (BOM, netlists, parts) aligned with the model.
- **Mechanism development** — mechanical/mechatronic design and implementation.
- **System deployment** — integration, deployment topology, and operational configuration.

Iteration flow: **plan** (modelbase) → **implement** (implement side) → **report** (implement side) → **decide & update plan** (modelbase) → repeat.

## Model layout


| File                                              | Package                          | Contents                                                                                                                          |
| ------------------------------------------------- | -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `models/requirements-modelbase-development.sysml` | ModelbaseDevelopmentRequirements | Requirements: four domains, workflow, iteration, plan-from-modelbase, report-from-implement-side, traceability.                   |
| `models/deploy-modelbase-development.sysml`       | ModelbaseDevelopment             | Structure: Modelbase and ImplementSide (e.g. codebase, hardware repo per domain); four development domains; composite deployment. |
| `models/behaviour-modelbase-development.sysml`    | ModelbaseDevelopmentBehaviour    | Workflow: Plan → develop (SW/HW/mech) → deploy → integrate → verify → ProduceImplementReport → UpdateModelFromGaps.               |
| `models/root-modelbase-development.sysml`         | ProjectModelbaseDevelopment      | Root: imports all project packages.                                                                                               |


Load order is defined in `config.yaml`. Diagrams: BDD/IBD via `python sysml-v2-models/scripts/visualize.py --project modelbase-development --diagram bdd`.

## Outputs

- **Workflow doc:** [modelbase-development-WORKFLOW.md](outputs/modelbase-development-WORKFLOW.md) — step-by-step workflow (roles, one iteration, artifacts, when to iterate); derived from this project's model.
- **Diagrams:** BDD/IBD in `outputs/` (from visualize.py).
- **Templates:** [PLAN_TEMPLATE.md](outputs/PLAN_TEMPLATE.md) (development plan, modelbase; plan versioning required) and [REPORT_TEMPLATE.md](outputs/REPORT_TEMPLATE.md) (implement report, implement side).

