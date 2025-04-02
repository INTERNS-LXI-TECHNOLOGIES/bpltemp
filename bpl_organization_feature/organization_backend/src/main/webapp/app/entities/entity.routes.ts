import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'organizationBackendApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'organization',
    data: { pageTitle: 'organizationBackendApp.organization.home.title' },
    loadChildren: () => import('./organization/organization.routes'),
  },
  {
    path: 'parentorganization',
    data: { pageTitle: 'organizationBackendApp.parentorganization.home.title' },
    loadChildren: () => import('./parentorganization/parentorganization.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
