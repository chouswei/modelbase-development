# Model-based development workflow (step-by-step)

**Output of the [modelbase-development](../) project.** This doc is derived from the SysML model (requirements, structure, behaviour) and describes the step-by-step workflow.

**Per domain the implement side may be named differently:** e.g. **codebase** (software), **hardware repo**, **mechanism repo**, **deployment repo**.

---

## 1. Roles (summary)

| Role | Does |
|------|------|
| **Modelbase** | Holds the SysML model and development plan (to do). **Generates** the plan from the model. **Receives** the implement report. May **update** plan or model after each iteration. |
| **Implement side** | **Implements** against the plan and model. **Produces** the implement report (alignment, gaps, traceability) and delivers it to the modelbase. |

---

## 2. One iteration (steps)

Follow these steps for each iteration. Only the **modelbase** can decide whether an iteration is done; when it decides done, it updates the plan for the next iteration.

| Step | Who | Action |
|------|-----|--------|
| **1. Generate plan** | Modelbase | Produce or update the development plan (to do) from the model: requirements, structure, behaviour, checkable steps, implementation layout. See [PLAN_TEMPLATE.md](PLAN_TEMPLATE.md). Plan flows to the implement side as the implementation guide. |
| **2. Implement** | Implement side | Execute development (software, hardware, mechanism, and/or system deployment) against the plan and model. Use the plan's phases and checkable steps. |
| **3. Integrate and verify** | Implement side | Integrate outputs; verify implementation against plan and model. Outcomes feed the implement report. |
| **4. Produce implement report** | Implement side | Produce the implement report (alignment, gaps, traceability) and deliver it to the modelbase. See [REPORT_TEMPLATE.md](REPORT_TEMPLATE.md). The implement side **only gives the report**; it does not decide if the iteration is done. Report flows to the modelbase. |
| **5. Receive report and update** | Modelbase | Receive the implement report. Review alignment and gaps. If needed, update the plan or model (e.g. optional actions, clarifications). Gaps are maintained in the implement-side repo; modelbase keeps only a pointer (e.g. `outputs/<project>-GAPS.md`). |
| **6. Decide** | Modelbase | **Only the modelbase decides** whether this iteration is done (scope delivered and acceptable). If **done:** modelbase **updates the plan** for the next iteration (e.g. new scope, promote "after v1" items, or close). If **not done:** implement side continues from step 2 with the same or updated plan. |

---

## 3. Artifacts and locations

| Artifact | Where it lives | Template or form |
|----------|----------------|------------------|
| **Development plan (to do)** | Modelbase, e.g. `outputs/<project>-DEVELOPMENT_PLAN.md` | [PLAN_TEMPLATE.md](PLAN_TEMPLATE.md) |
| **SysML model** | Modelbase, e.g. `models/*.sysml` | — |
| **Alignment** | Implement-side repo, e.g. `docs/MODELBASE_ALIGNMENT.md` | Part of report (see [REPORT_TEMPLATE.md](REPORT_TEMPLATE.md)) |
| **Gaps** | Implement-side repo, e.g. `docs/GAPS.md`; modelbase has pointer only, e.g. `outputs/<project>-GAPS.md` | Part of report template |
| **Traceability (plan step → implementation)** | Implement-side repo, e.g. `docs/IMPLEMENTATION_PLAN.md` | Part of report template |

---

## 4. Iteration boundaries (handover)

**End of iteration**

1. Implement side delivers the implement report (iteration block + alignment + gaps + traceability) to the modelbase.
2. Modelbase receives the report, reviews it, and **decides** whether this iteration is done (only modelbase decides).
3. If **done:** Modelbase **updates the plan** for the next iteration (new scope, promote "after v1" items from §6, or close). **Update Plan version and change note** (required); see [PLAN_TEMPLATE.md](PLAN_TEMPLATE.md).
4. If **not done:** Modelbase may still update the plan (e.g. clarifications); implement side continues from step 2 with the same or updated plan.

**Start of next iteration**

1. Implement side has the **current** plan (the version the modelbase updated after the last report).
2. Implement side starts from **step 2 (Implement)** with the scope defined in that plan for this iteration.
3. When work for this iteration is complete, implement side produces and delivers the **next** report (next iteration). Repeat from "End of iteration" above.

**One iteration** = implement side works to the current plan → delivers one report → modelbase decides and updates plan → implement side takes updated plan and starts the next iteration (or continues).

---

## 5. When to run another iteration

- **Modelbase** decides the iteration is done (after reviewing the implement report). Then modelbase updates the plan for the next iteration (new scope, "after v1" items, or close).
- After the modelbase has updated the plan, the implement side starts the **next** iteration from step 2 with the updated plan.
- When starting a new phase or "after v1" scope, use the plan's §6 and gaps as backlog.

---

## 6. References (within this project)

- **SysML model of this workflow:** [modelbase-development](../) ([models/](../models/): requirements, deploy, behaviour; plan and report as flow items).
- **Plan template:** [PLAN_TEMPLATE.md](PLAN_TEMPLATE.md).
- **Report template:** [REPORT_TEMPLATE.md](REPORT_TEMPLATE.md).
