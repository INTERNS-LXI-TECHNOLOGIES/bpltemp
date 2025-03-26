import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { CurrencyTypeService } from '../service/currency-type.service';
import { ICurrencyType } from '../currency-type.model';
import { CurrencyTypeFormService } from './currency-type-form.service';

import { CurrencyTypeUpdateComponent } from './currency-type-update.component';

describe('CurrencyType Management Update Component', () => {
  let comp: CurrencyTypeUpdateComponent;
  let fixture: ComponentFixture<CurrencyTypeUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let currencyTypeFormService: CurrencyTypeFormService;
  let currencyTypeService: CurrencyTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [CurrencyTypeUpdateComponent],
      providers: [
        provideHttpClient(),
        FormBuilder,
        {
          provide: ActivatedRoute,
          useValue: {
            params: from([{}]),
          },
        },
      ],
    })
      .overrideTemplate(CurrencyTypeUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(CurrencyTypeUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    currencyTypeFormService = TestBed.inject(CurrencyTypeFormService);
    currencyTypeService = TestBed.inject(CurrencyTypeService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const currencyType: ICurrencyType = { id: 18260 };

      activatedRoute.data = of({ currencyType });
      comp.ngOnInit();

      expect(comp.currencyType).toEqual(currencyType);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ICurrencyType>>();
      const currencyType = { id: 3445 };
      jest.spyOn(currencyTypeFormService, 'getCurrencyType').mockReturnValue(currencyType);
      jest.spyOn(currencyTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ currencyType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: currencyType }));
      saveSubject.complete();

      // THEN
      expect(currencyTypeFormService.getCurrencyType).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(currencyTypeService.update).toHaveBeenCalledWith(expect.objectContaining(currencyType));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ICurrencyType>>();
      const currencyType = { id: 3445 };
      jest.spyOn(currencyTypeFormService, 'getCurrencyType').mockReturnValue({ id: null });
      jest.spyOn(currencyTypeService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ currencyType: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: currencyType }));
      saveSubject.complete();

      // THEN
      expect(currencyTypeFormService.getCurrencyType).toHaveBeenCalled();
      expect(currencyTypeService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ICurrencyType>>();
      const currencyType = { id: 3445 };
      jest.spyOn(currencyTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ currencyType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(currencyTypeService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
