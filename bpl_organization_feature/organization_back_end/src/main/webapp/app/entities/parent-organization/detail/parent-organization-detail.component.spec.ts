import { ComponentFixture, TestBed } from '@angular/core/testing';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { RouterTestingHarness } from '@angular/router/testing';
import { of } from 'rxjs';

import { ParentOrganizationDetailComponent } from './parent-organization-detail.component';

describe('ParentOrganization Management Detail Component', () => {
  let comp: ParentOrganizationDetailComponent;
  let fixture: ComponentFixture<ParentOrganizationDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ParentOrganizationDetailComponent],
      providers: [
        provideRouter(
          [
            {
              path: '**',
              loadComponent: () => import('./parent-organization-detail.component').then(m => m.ParentOrganizationDetailComponent),
              resolve: { parentOrganization: () => of({ id: 4781 }) },
            },
          ],
          withComponentInputBinding(),
        ),
      ],
    })
      .overrideTemplate(ParentOrganizationDetailComponent, '')
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParentOrganizationDetailComponent);
    comp = fixture.componentInstance;
  });

  describe('OnInit', () => {
    it('Should load parentOrganization on init', async () => {
      const harness = await RouterTestingHarness.create();
      const instance = await harness.navigateByUrl('/', ParentOrganizationDetailComponent);

      // THEN
      expect(instance.parentOrganization()).toEqual(expect.objectContaining({ id: 4781 }));
    });
  });

  describe('PreviousState', () => {
    it('Should navigate to previous state', () => {
      jest.spyOn(window.history, 'back');
      comp.previousState();
      expect(window.history.back).toHaveBeenCalled();
    });
  });
});
