// PAC file
// Send message if we are ready
browser.runtime.sendMessage('pac_script_init');
// set rules on message from background script
var rule = '';
browser.runtime.onMessage.addListener(function (msg) {
    rule = msg.rule;
});
// required PAC function that will be called to determine
// if a proxy should be used.
function getIp(host) {
    return /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.test(host);
}
function isLocalIp(host) {
    var ip = host.match(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)[0];
    return ipIsInCidr(ip, '127.0.0.0/8') ||
        ipIsInCidr(ip, '10.0.0.0/8') ||
        ipIsInCidr(ip, '172.16.0.0/12') ||
        ipIsInCidr(ip, '192.168.0.0/16');
}
function ipIsInCidr(ip, cidr) {
    var splittedCIDR = cidr.split('/');
    var cidrIp = splittedCIDR[0];
    var cidrSm = splittedCIDR[1];
    return (iPNumber(ip) & iPMask(cidrSm)) === iPNumber(cidrIp);
}
function iPMask(maskSize) {
    return -1 << (32 - maskSize);
}
function iPNumber(iPaddress) {
    var ip = iPaddress.match(/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/);
    if (ip) {
        return (+ip[1] << 24) + (+ip[2] << 16) + (+ip[3] << 8) + (+ip[4]);
    }
    return null;
}
// This is my global function that will used in another file
/**
 * global FindProxyForURL
 * @param {string} url The first number.
 * @param {string} host The second number.
 * @return {string} DIRECT or rules.
 */
function FindProxyForURL(url, host) {
    if (rule === '' ||
        host.indexOf('localhost') !== -1 ||
        (!!getIp(host) && isLocalIp(host))) {
        return 'DIRECT';
    }
    browser.runtime.sendMessage({ rule: rule, host: host });
    return rule;
}
