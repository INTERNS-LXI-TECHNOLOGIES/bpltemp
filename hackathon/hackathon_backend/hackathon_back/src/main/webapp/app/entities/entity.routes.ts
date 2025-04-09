import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'hackathonBackApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'company',
    data: { pageTitle: 'hackathonBackApp.company.home.title' },
    loadChildren: () => import('./company/company.routes'),
  },
  {
    path: 'employee',
    data: { pageTitle: 'hackathonBackApp.employee.home.title' },
    loadChildren: () => import('./employee/employee.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
