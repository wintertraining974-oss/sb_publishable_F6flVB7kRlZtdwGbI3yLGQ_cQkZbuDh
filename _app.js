export const START_DATE = '2026-11-01'
export const END_DATE   = '2027-03-01'

// Jours fériés FIXES à leur date exacte, même si dimanche
export const HOLIDAYS = {
  '2026-11-01': 'Toussaint',
  '2026-11-11': 'Armistice 1918',
  '2026-12-20': 'Abolition de l\'esclavage',
  '2026-12-25': 'Noël',
  '2027-01-01': 'Jour de l\'An',
}

export const DEFAULT_MORNING_ORDER   = ['9h-10h', '10h-11h', '11h-12h']
export const DEFAULT_AFTERNOON_ORDER = ['15h-16h', '14h-15h', '13h-14h']

export const DEFAULT_CAPACITY = {
  '9h-10h': 15, '10h-11h': 15, '11h-12h': 15,
  '15h-16h': 15, '14h-15h': 15, '13h-14h': 15,
}

export const DAYS_FR   = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam']
export const DAYS_FULL = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi']
export const MONTHS_FR = [
  'Janvier','Février','Mars','Avril','Mai','Juin',
  'Juillet','Août','Septembre','Octobre','Novembre','Décembre'
]

export const ADMIN_CODE = '3103'
