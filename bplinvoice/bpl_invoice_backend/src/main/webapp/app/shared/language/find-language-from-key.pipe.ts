import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'findLanguageFromKey',
})
export default class FindLanguageFromKeyPipe implements PipeTransform {
  private readonly languages: Record<string, { name: string; rtl?: boolean }> = {
    en: { name: 'English' },
    'zh-cn': { name: '中文（简体）' },
    nl: { name: 'Nederlands' },
    fr: { name: 'Français' },
    de: { name: 'Deutsch' },
    hi: { name: 'हिंदी' },
    ja: { name: '日本語' },
    ta: { name: 'தமிழ்' },
    // jhipster-needle-i18n-language-key-pipe - JHipster will add/remove languages in this object
  };

  transform(lang: string): string {
    return this.languages[lang].name;
  }
}
