import config from '../config'
import { guid } from '../util/helpers'

const fields = {
  basic: []
}

let defvals = config.DEFAULTS

function seed () {
  const basic = [
    { name: 'Full name', type: 'text', value: defvals.FULL_NAME },
    { name: 'Job title', type: 'text', value: defvals.JOB_TITLE },
    { name: 'Company', type: 'text', value: defvals.COMPANY_NAME },
    { name: 'Website', type: 'link', value: defvals.WEBSITE},
    { name: 'Email', type: 'email', value: defvals.CONTACT_EMAIL},
    { name: 'Phone', type: 'text', value: defvals.PHONE_NUMBER}
  ]

  basic.forEach(item => {
    fields.basic.push({ ...item, id: guid() })
  })

  addPlaceholder()
}

function addPlaceholder () {
  const placeholders = [
    defvals.FULL_NAME,
    defvals.JOB_TITLE,
    defvals.COMPANY_NAME,
    defvals.WEBSITE,
    defvals.CONTACT_EMAIL,
    defvals.PHONE_NUMBER
  ]

  fields.basicPlaceholder = [
    ...fields.basic.map((item, index) => {
      return { ...item, value: placeholders[index] }
    })
  ]
}

seed()

export default fields
