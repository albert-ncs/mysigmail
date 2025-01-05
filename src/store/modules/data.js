import config from '../../config'

export default {
  addons: {
    disclaimer: config.DEFAULTS.DISCLAIMER,
    mobileApp: {
      appStore: {
        img: `${config.ICON_URL}/app-store-badge.png`,
        link: config.DEFAULT_URL
      },
      googlePlay: {
        img: `${config.ICON_URL}/google-play-badge.png`,
        link: config.DEFAULT_URL
      }
    }
  }
}
