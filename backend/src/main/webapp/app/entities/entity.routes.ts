import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'agentTypeApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'agent-type',
    data: { pageTitle: 'agentTypeApp.agentType.home.title' },
    loadChildren: () => import('./agent-type/agent-type.routes'),
  },
  {
    path: 'organisation',
    data: { pageTitle: 'agentTypeApp.organisation.home.title' },
    loadChildren: () => import('./organisation/organisation.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
