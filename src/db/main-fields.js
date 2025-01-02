import { guid } from '../util/helpers'

const fields = {
  basic: []
}

function seed () {
  const basic = [
    { name: 'Full name', type: 'text', value: '' },
    { name: 'Job title', type: 'text', value: '' },
    { name: 'Company', type: 'text', value: '' },
    { name: 'Website', type: 'link', value: '' },
    { name: 'Email', type: 'email', value: '' },
    { name: 'Phone', type: 'text', value: '' }
  ]

  basic.forEach(item => {
    fields.basic.push({ ...item, id: guid() })
  })

  addPlaceholder()
}

function addPlaceholder () {
  const placeholders = [
    'John Doe',
    'IT Manager',
    'Neurocritical Care Specialists, Inc.',
    'neurocriticalcarespecialists.com',
    'john.doe@neurocriticalcarespecialists.com',
    '(239) 427-5541'
  ]

  fields.basicPlaceholder = [
    ...fields.basic.map((item, index) => {
      return { ...item, value: placeholders[index] }
    })
  ]
}

seed()

export default fields
