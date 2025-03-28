import dayjs from 'dayjs/esm';
import customParseFormat from 'dayjs/esm/plugin/customParseFormat';
import duration from 'dayjs/esm/plugin/duration';
import relativeTime from 'dayjs/esm/plugin/relativeTime';

// jhipster-needle-i18n-language-dayjs-imports - JHipster will import languages from dayjs here
import 'dayjs/esm/locale/en';
import 'dayjs/esm/locale/zh-cn';
import 'dayjs/esm/locale/nl';
import 'dayjs/esm/locale/fr';
import 'dayjs/esm/locale/de';
import 'dayjs/esm/locale/hi';
import 'dayjs/esm/locale/ja';
import 'dayjs/esm/locale/ta';

// DAYJS CONFIGURATION
dayjs.extend(customParseFormat);
dayjs.extend(duration);
dayjs.extend(relativeTime);
