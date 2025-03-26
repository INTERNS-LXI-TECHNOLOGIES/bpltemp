import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'organizationBackEndApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'organization',
    data: { pageTitle: 'organizationBackEndApp.organization.home.title' },
    loadChildren: () => import('./organization/organization.routes'),
  },
  {
    path: 'parent-organization',
    data: { pageTitle: 'organizationBackEndApp.parentOrganization.home.title' },
    loadChildren: () => import('./parent-organization/parent-organization.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
