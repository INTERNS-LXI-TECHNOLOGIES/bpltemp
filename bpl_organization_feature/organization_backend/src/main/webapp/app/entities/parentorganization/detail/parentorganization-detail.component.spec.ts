import { ComponentFixture, TestBed } from '@angular/core/testing';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { RouterTestingHarness } from '@angular/router/testing';
import { of } from 'rxjs';

import { ParentorganizationDetailComponent } from './parentorganization-detail.component';

describe('Parentorganization Management Detail Component', () => {
  let comp: ParentorganizationDetailComponent;
  let fixture: ComponentFixture<ParentorganizationDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ParentorganizationDetailComponent],
      providers: [
        provideRouter(
          [
            {
              path: '**',
              loadComponent: () => import('./parentorganization-detail.component').then(m => m.ParentorganizationDetailComponent),
              resolve: { parentorganization: () => of({ id: 4781 }) },
            },
          ],
          withComponentInputBinding(),
        ),
      ],
    })
      .overrideTemplate(ParentorganizationDetailComponent, '')
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParentorganizationDetailComponent);
    comp = fixture.componentInstance;
  });

  describe('OnInit', () => {
    it('Should load parentorganization on init', async () => {
      const harness = await RouterTestingHarness.create();
      const instance = await harness.navigateByUrl('/', ParentorganizationDetailComponent);

      // THEN
      expect(instance.parentorganization()).toEqual(expect.objectContaining({ id: 4781 }));
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
