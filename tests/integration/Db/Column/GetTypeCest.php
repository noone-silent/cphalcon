<?php

/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalconphp.com>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Test\Integration\Db\Column;

use IntegrationTester;
use Phalcon\Test\Fixtures\Traits\Db\MysqlTrait;
use Phalcon\Test\Fixtures\Traits\DiTrait;

class GetTypeCest
{
    use DiTrait;
    use MysqlTrait;

    /**
     * Tests Phalcon\Db\Column :: getType()
     *
     * @param IntegrationTester $I
     *
     * @author Phalcon Team <team@phalconphp.com>
     * @since  2018-11-13
     */
    public function dbColumnGetType(IntegrationTester $I)
    {
        $I->wantToTest("Db\Column - getType()");
        $columns         = $this->getColumns();
        $expectedColumns = $this->getExpectedColumns();
        foreach ($expectedColumns as $index => $column) {
            $I->assertEquals($columns[$index]['_type'], $column->getType());
        }
    }
}