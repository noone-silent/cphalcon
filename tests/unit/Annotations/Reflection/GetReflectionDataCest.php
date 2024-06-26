<?php

/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalcon.io>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace Phalcon\Tests\Unit\Annotations\Reflection;

use Phalcon\Annotations\Reflection;
use UnitTester;

class GetReflectionDataCest
{
    /**
     * Tests Phalcon\Annotations\Reflection :: getReflectionData()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2018-11-13
     */
    public function annotationsReflectionGetReflectionData(UnitTester $I)
    {
        $I->wantToTest('Annotations\Reflection - getReflectionData()');

        $reflection = new Reflection();

        $I->assertIsArray($reflection->getReflectionData());
        $I->assertIsEmpty($reflection->getReflectionData());
    }
}
