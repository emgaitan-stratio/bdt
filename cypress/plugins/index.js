const path = require('path');

/**
 * @type {Cypress.PluginConfig}
 */
module.exports = (on, config) => {
    // `on` is used to hook into various events Cypress emits
    // `config` is the resolved Cypress config
debugger;

    const options = {
        outputRoot: config.projectRoot + '/target/',
        specRoot: path.relative(config.fileServerFolder, config.integrationFolder),
        outputTarget: {
            'executions|txt': 'txt',
        },
        printLogsToConsole: 'always',
        printLogsToFile: 'always'
    };

    require('cypress-terminal-report/src/installLogsPrinter')(on, options);
}
